DO $$
DECLARE 
IdFormsInserted bigint;
IdFieldsInserted  bigint;
BEGIN
    INSERT INTO FormsOrigins(Id, Name, Active) VALUES (DEFAULT, 'WP6.MobileApp', 1);

    INSERT INTO FieldsDataTypes(Id, Name, Description, Active) VALUES (DEFAULT, 'integer', 'data type integer', 1);
    INSERT INTO FieldsDataTypes(Id, Name, Description, Active) VALUES (DEFAULT, 'text', 'data type text', 1);
    INSERT INTO FieldsDataTypes(Id, Name, Description, Active) VALUES (DEFAULT, 'real', 'data type real', 1);
    INSERT INTO FieldsDataTypes(Id, Name, Description, Active) VALUES (DEFAULT, 'timestamp', 'data type timestamp', 1);

    --FloodZones Form
    INSERT INTO Forms(IdFormsOrigins, Code, Name, Description, DtCreation, Active) 
            SELECT fo.Id, 'FLOODZONES-FORM', 'FloodZones', 'FloodZones Form', current_timestamp, 1 FROM FormsOrigins fo WHERE fo.Name = 'WP6.MobileApp' 
            RETURNING Id INTO IdFormsInserted;

    INSERT INTO Fields(IdFieldsDataTypes, Name, Description, FillingClue, Active)
        SELECT fdt.Id, 'Id', 'Id From FloodZones Form', '', 1 FROM FieldsDataTypes fdt WHERE fdt.Name = 'integer' 
            RETURNING Id INTO IdFieldsInserted;
    INSERT INTO FormsFields(Id, IdForms, IdFields, Active) VALUES (DEFAULT, IdFormsInserted, IdFieldsInserted, 1);

    INSERT INTO Fields(IdFieldsDataTypes, Name, Description, FillingClue, Active)
        SELECT fdt.Id, 'Description', 'Description From FloodZones Form', '', 1 FROM FieldsDataTypes fdt WHERE fdt.Name = 'text'
            RETURNING Id INTO IdFieldsInserted;
    INSERT INTO FormsFields(Id, IdForms, IdFields, Active) VALUES (DEFAULT, IdFormsInserted, IdFieldsInserted, 1);

    INSERT INTO Fields(IdFieldsDataTypes, Name, Description, FillingClue, Active)
        SELECT fdt.Id, 'Images', 'Images From FloodZones Form', '', 1 FROM FieldsDataTypes fdt WHERE fdt.Name = 'text'
            RETURNING Id INTO IdFieldsInserted;
    INSERT INTO FormsFields(Id, IdForms, IdFields, Active) VALUES (DEFAULT, IdFormsInserted, IdFieldsInserted, 1);

    INSERT INTO Fields(IdFieldsDataTypes, Name, Description, FillingClue, Active)
        SELECT fdt.Id, 'Latitude', 'Latitude From FloodZones Form', '', 1 FROM FieldsDataTypes fdt WHERE fdt.Name = 'real'
            RETURNING Id INTO IdFieldsInserted;
    INSERT INTO FormsFields(Id, IdForms, IdFields, Active) VALUES (DEFAULT, IdFormsInserted, IdFieldsInserted, 1);

    INSERT INTO Fields(IdFieldsDataTypes, Name, Description, FillingClue, Active)
        SELECT fdt.Id, 'Longitude', 'Longitude From FloodZones Form', '', 1 FROM FieldsDataTypes fdt WHERE fdt.Name = 'real'
            RETURNING Id INTO IdFieldsInserted;
    INSERT INTO FormsFields(Id, IdForms, IdFields, Active) VALUES (DEFAULT, IdFormsInserted, IdFieldsInserted, 1);

    INSERT INTO Fields(IdFieldsDataTypes, Name, Description, FillingClue, Active)
        SELECT fdt.Id, 'Passable', 'Passable From FloodZones Form', '', 1 FROM FieldsDataTypes fdt WHERE fdt.Name = 'integer'
            RETURNING Id INTO IdFieldsInserted;
    INSERT INTO FormsFields(Id, IdForms, IdFields, Active) VALUES (DEFAULT, IdFormsInserted, IdFieldsInserted, 1);

    INSERT INTO Fields(IdFieldsDataTypes, Name, Description, FillingClue, Active)
        SELECT fdt.Id, 'Date', 'Date From FloodZones Form', '', 1 FROM FieldsDataTypes fdt WHERE fdt.Name = 'text'
            RETURNING Id INTO IdFieldsInserted;
    INSERT INTO FormsFields(Id, IdForms, IdFields, Active) VALUES (DEFAULT, IdFormsInserted, IdFieldsInserted, 1);

    INSERT INTO Fields(IdFieldsDataTypes, Name, Description, FillingClue, Active)
        SELECT fdt.Id, 'Time', 'Time From FloodZones Form', '', 1 FROM FieldsDataTypes fdt WHERE fdt.Name = 'text'
            RETURNING Id INTO IdFieldsInserted;
    INSERT INTO FormsFields(Id, IdForms, IdFields, Active) VALUES (DEFAULT, IdFormsInserted, IdFieldsInserted, 1);

    INSERT INTO Fields(IdFieldsDataTypes, Name, Description, FillingClue, Active)
        SELECT fdt.Id, 'Address', 'Address From FloodZones Form', '', 1 FROM FieldsDataTypes fdt WHERE fdt.Name = 'text'
            RETURNING Id INTO IdFieldsInserted;
    INSERT INTO FormsFields(Id, IdForms, IdFields, Active) VALUES (DEFAULT, IdFormsInserted, IdFieldsInserted, 1);
    --End FloodZones Form
END $$;

--delete from FormsFields;
--delete from Fields;
--delete from Forms;
--delete from FieldsDataTypes;
--delete from FormsOrigins;
