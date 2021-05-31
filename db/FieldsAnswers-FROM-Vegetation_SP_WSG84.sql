DO $$
DECLARE 
    var_idforms bigint;
    var_iduserinformer bigint;
    var_idformsanswers bigint;
    curr CURSOR FOR SELECT * FROM vegetation_sp_wsg84;
    curr_row RECORD;
BEGIN
    SELECT 1 INTO var_iduserinformer; --user: admin wpd

    --get the idforms
    SELECT f.id INTO var_idforms FROM forms f INNER JOIN formsorigins fo ON f.idformsorigins = fo.id WHERE f.code = 'vegetation_sp_wsg84' AND fo.name = 'OFICIAL';

    --delete previous records
    DELETE FROM fieldsanswers fa 
    USING formsfields ff, forms f
    WHERE 
        fa.idfields = ff.idfields
        AND ff.idforms = f.id 
        AND f.id = var_idforms;

    OPEN curr;
    LOOP
        FETCH FROM curr INTO curr_row;
        EXIT WHEN NOT FOUND;

        --insert new formsAnswers
        INSERT INTO formsanswers(idforms, idusersinformer, dtfilling)
            SELECT var_idforms, var_iduserinformer, current_timestamp
                RETURNING id INTO var_idformsanswers;

        --inserts ALL fields into fieldsanswers FROM geoTable
        INSERT INTO fieldsanswers(idfields, idformsanswers, value) 
            SELECT f.id, var_idformsanswers, curr_row.gid 
            FROM fields f INNER JOIN formsfields ff ON f.id = ff.idfields 
            WHERE f.name = 'gid' AND ff.idforms = var_idforms;

        INSERT INTO fieldsanswers(idfields, idformsanswers, value) 
            SELECT f.id, var_idformsanswers, curr_row.ma_cl_vegt 
            FROM fields f INNER JOIN formsfields ff ON f.id = ff.idfields 
            WHERE f.name = 'ma_cl_vegt' AND ff.idforms = var_idforms;

        INSERT INTO fieldsanswers(idfields, idformsanswers, value) 
            SELECT f.id, var_idformsanswers, curr_row.ma_area_ha 
            FROM fields f INNER JOIN formsfields ff ON f.id = ff.idfields 
            WHERE f.name = 'ma_area_ha' AND ff.idforms = var_idforms;

        INSERT INTO fieldsanswers(idfields, idformsanswers, value) 
            SELECT f.id, var_idformsanswers, curr_row.ma_area_mt 
            FROM fields f INNER JOIN formsfields ff ON f.id = ff.idfields 
            WHERE f.name = 'ma_area_mt' AND ff.idforms = var_idforms;

        INSERT INTO fieldsanswers(idfields, idformsanswers, value) 
            SELECT f.id, var_idformsanswers, curr_row.ma_projeto 
            FROM fields f INNER JOIN formsfields ff ON f.id = ff.idfields 
            WHERE f.name = 'ma_projeto' AND ff.idforms = var_idforms;

        INSERT INTO fieldsanswers(idfields, idformsanswers, value) 
            SELECT f.id, var_idformsanswers, curr_row.ma_dt_carg 
            FROM fields f INNER JOIN formsfields ff ON f.id = ff.idfields 
            WHERE f.name = 'ma_dt_carg' AND ff.idforms = var_idforms;

        INSERT INTO fieldsanswers(idfields, idformsanswers, value) 
            SELECT f.id, var_idformsanswers, curr_row.ma_fonte 
            FROM fields f INNER JOIN formsfields ff ON f.id = ff.idfields 
            WHERE f.name = 'ma_fonte' AND ff.idforms = var_idforms;

        INSERT INTO fieldsanswers(idfields, idformsanswers, value) 
            SELECT f.id, var_idformsanswers, curr_row.ma_id 
            FROM fields f INNER JOIN formsfields ff ON f.id = ff.idfields 
            WHERE f.name = 'ma_id' AND ff.idforms = var_idforms;

        INSERT INTO fieldsanswers(idfields, idformsanswers, value) 
            SELECT f.id, var_idformsanswers, curr_row.ma_cd_vegt 
            FROM fields f INNER JOIN formsfields ff ON f.id = ff.idfields 
            WHERE f.name = 'ma_cd_vegt' AND ff.idforms = var_idforms;

        INSERT INTO fieldsanswers(idfields, idformsanswers, geom) 
            SELECT f.id, var_idformsanswers, curr_row.geom 
            FROM fields f INNER JOIN formsfields ff ON f.id = ff.idfields 
            WHERE f.name = 'geom' AND ff.idforms = var_idforms;
    END LOOP;
    CLOSE curr;          

END $$;
