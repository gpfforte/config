SELECT id_transitpoint,
         dt_riferimento,
         SUM (peso_crossdocking)     AS tot_peso_crossdocking,
         SUM (peso_diretto)          AS tot_peso_diretto
    FROM (  SELECT id_transitpoint,
                   dt_riferimento,
                   SUM (peso_crossdocking)     AS peso_crossdocking,
                   SUM (peso_diretto)          AS peso_diretto
              FROM (SELECT DISTINCT
                           sm.id_transitpoint
                               AS id_transitpoint,
                           sm.ID_UDS_DA,
                           dbo.TRUNC_DATE (sm.DT_CONFERMA)
                               AS dt_riferimento,
                           sm.ms_peso
                               AS peso_crossdocking,
                           0
                               AS peso_diretto
                      FROM storico_movimenti sm
                     WHERE     (   sm.id_transitpoint LIKE '64%'
                                OR sm.id_transitpoint LIKE '65%'
                                OR sm.id_transitpoint LIKE '72%'
                                OR sm.id_transitpoint LIKE '1D%'
                                OR sm.id_transitpoint LIKE '3D%'
                                OR sm.id_transitpoint LIKE '5D%')
                           AND sm.tp_movimento = 'SD'
                           AND sm.id_flusso = 'TESPED') q1
          GROUP BY id_transitpoint, dt_riferimento
          UNION ALL
            SELECT id_transitpoint,
                   dt_riferimento,
                   SUM (peso_crossdocking)     AS peso_crossdocking,
                   SUM (peso_diretto)          AS peso_diretto
              FROM (SELECT DISTINCT
                           sm.id_sito + '_' + tr.id_transitpoint
                               AS id_transitpoint,
                           sm.ID_UDS_DA,
                           dbo.TRUNC_DATE (sm.DT_CONFERMA)
                               AS dt_riferimento,
                           0
                               AS peso_crossdocking,
                           sm.ms_peso
                               AS peso_diretto
                      FROM storico_movimenti sm
                           INNER JOIN siti si ON sm.ID_SITO = si.id_sito
                           INNER JOIN transitpoints tr
                               ON     si.oid = tr.oid_sito
                                  AND sm.ID_CLIENTE = tr.id_transitpoint
                     WHERE     sm.id_sito IN ('64',
                                              '65',
                                              '72',
                                              '1D',
                                              '3D',
                                              '5D')
                           AND sm.tp_movimento = 'SD'
                           AND sm.id_flusso IN ('VPCTP', 'VPCTRA', 'VPCSPE')) q2
          GROUP BY id_transitpoint, dt_riferimento) app
   WHERE dt_riferimento BETWEEN CAST ('2023-11-08' AS DATE)
                            AND CAST ('2023-11-09' AS DATE)
GROUP BY id_transitpoint, dt_riferimento
ORDER BY id_transitpoint, dt_riferimento;
