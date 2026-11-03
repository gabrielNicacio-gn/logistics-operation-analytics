CREATE TABLE day_operation(
        day_operation_id UUID PRIMARY KEY
        operation_date DATE NOT NULL UNIQUE
);

CREATE TABLE snapshot(
        snapshot_id UUID PRIMARY KEY,
        day_operation_id UUID NOT NULL,
        captured_at TIMESTAMP NOT NULL,
        is_first_registration BOOLEAN NOT NULL 

        CONSTRAINT fk_day_operation_id 
        FOREIGN KEY(day_operation_id)
        REFERENCES day_operation (day_operation_id)

);

CREATE TABLE snapshot_sector(
        snapshot_sector_id UUID PRIMARY KEY,
        snapshot_id UUID NOT NULL,
        sector VARCHAR(30) NOT NULL 
        total_pickings INTEGER NOT NULL, 
        pending_pickings INTEGER NOT NULL,
        new_pickings INTEGER NOT NULL,

        CONSTRAINT uq_snapshot_sector
        UNIQUE(snapshot_id, sector),

        CONSTRAINT fk_snapshot_id
        FOREIGN KEY(snapshot_id)
        REFERENCES snapshot (snapshot_id) 
);

CREATE TABLE metrics(
        metrics_id UUID PRIMARY KEY,
        snapshot_sector_id UUID NOT NULL UNIQUE,
        production INTEGER NOT NULL,
        cumulative_production INTEGER NOT NULL,
        avg_prodution_time INTERVAL,

        CONSTRAINT fk_snapshot_sector_id
        FOREIGN KEY (snapshot_sector_id)
        REFERENCES snapshot_sector (snapshot_sector_id)
);

