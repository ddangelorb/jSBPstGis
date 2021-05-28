DO $$
DECLARE 
idformsinserted bigint;
idfieldsinserted  bigint;
BEGIN
    INSERT INTO users(email, firstname, surname, active) VALUES ('admin@wpd.com', 'admin', 'wpd', 1);

    INSERT INTO formsOrigins(id, name, active) VALUES (DEFAULT, 'WP6.MobileApp', 1);
    INSERT INTO formsOrigins(id, name, active) VALUES (DEFAULT, 'Livia', 1);

    INSERT INTO fieldsdatatypes(id, name, description, active) VALUES (DEFAULT, 'integer', 'data type integer', 1);
    INSERT INTO fieldsdatatypes(id, name, description, active) VALUES (DEFAULT, 'text', 'data type text', 1);
    INSERT INTO fieldsdatatypes(id, name, description, active) VALUES (DEFAULT, 'real', 'data type real', 1);
    INSERT INTO fieldsdatatypes(id, name, description, active) VALUES (DEFAULT, 'timestamp', 'data type timestamp', 1);
    INSERT INTO fieldsdatatypes(id, name, description, active) VALUES (DEFAULT, 'geom', 'data type geometric', 1);

    --Shape file Vegetation_SP_WSG84
    INSERT INTO forms(idformsOrigins, code, name, description, dtcreation, active) 
            SELECT fo.id, 'Vegetation_SP_WSG84', 'Vegetation_SP_WSG84 sh file', 'Vegetation_SP_WSG84 shape file', current_timestamp, 1 FROM formsOrigins fo WHERE fo.name = 'Livia' 
            RETURNING id INTO idformsinserted;

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'gid', 'gid From Vegetation_SP_WSG84 shape file', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'integer' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'ma_cl_vegt', 'ma_cl_vegt From Vegetation_SP_WSG84 shape file', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'text' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'ma_area_ha', 'ma_area_ha From Vegetation_SP_WSG84 shape file', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'integer' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'ma_area_mt', 'ma_area_mt From Vegetation_SP_WSG84 shape file', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'integer' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'ma_projeto', 'ma_projeto From Vegetation_SP_WSG84 shape file', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'text' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'ma_dt_carg', 'ma_dt_carg From Vegetation_SP_WSG84 shape file', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'text' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'ma_fonte', 'ma_fonte From Vegetation_SP_WSG84 shape file', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'text' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'ma_id', 'ma_id From Vegetation_SP_WSG84 shape file', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'integer' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'ma_cd_vegt', 'ma_cd_vegt From Vegetation_SP_WSG84 shape file', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'text' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'geom', 'geom From Vegetation_SP_WSG84 shape file', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'geom' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);
    --End Shape file Vegetation_SP_WSG84


    --FloodZones Form
    INSERT INTO forms(idformsOrigins, code, name, description, dtcreation, active) 
            SELECT fo.id, 'FLOODZONES-FORM', 'FloodZones', 'FloodZones Form', current_timestamp, 1 FROM formsOrigins fo WHERE fo.name = 'WP6.MobileApp' 
            RETURNING id INTO idformsinserted;

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'id', 'id From FloodZones Form', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'integer' 
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'description', 'description From FloodZones Form', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'text'
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'Images', 'Images From FloodZones Form', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'text'
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'Latitude', 'Latitude From FloodZones Form', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'real'
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'Longitude', 'Longitude From FloodZones Form', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'real'
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'Passable', 'Passable From FloodZones Form', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'integer'
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'Date', 'Date From FloodZones Form', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'text'
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'Time', 'Time From FloodZones Form', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'text'
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);

    INSERT INTO fields(idfieldsdatatypes, name, description, fillingclue, active)
        SELECT fdt.id, 'Address', 'Address From FloodZones Form', '', 1 FROM fieldsdatatypes fdt WHERE fdt.name = 'text'
            RETURNING id INTO idfieldsinserted;
    INSERT INTO formsfields(id, idforms, idfields, active) VALUES (DEFAULT, idformsinserted, idfieldsinserted, 1);
    --End FloodZones Form

END $$;

--delete from formsfields;
--delete from fields;
--delete from forms;
--delete from fieldsdatatypes;
--delete from formsOrigins;
