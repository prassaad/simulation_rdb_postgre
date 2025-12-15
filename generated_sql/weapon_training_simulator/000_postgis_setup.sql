-- ================================================
-- POSTGIS SETUP & SPATIAL INDEXES (SAAB-Grade Weapon Training Simulator)
-- ================================================

CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_topology;

-- Spatial GIST indexes for high-performance 3D queries (AAR, trajectory analysis)

CREATE INDEX IF NOT EXISTS "ix_shot_records_shooter_position"
    ON public."shot_records" USING GIST ("shooter_position");

CREATE INDEX IF NOT EXISTS "ix_shot_records_target_position"
    ON public."shot_records" USING GIST ("target_position");

CREATE INDEX IF NOT EXISTS "ix_shot_records_impact_point"
    ON public."shot_records" USING GIST ("impact_point");

CREATE INDEX IF NOT EXISTS "ix_shot_records_trajectory"
    ON public."shot_records" USING GIST ("trajectory");

CREATE INDEX IF NOT EXISTS "ix_trainees_home_base_location"
    ON public."trainees" USING GIST ("home_base_location");

CREATE INDEX IF NOT EXISTS "ix_training_sessions_firing_position_start"
    ON public."training_sessions" USING GIST ("firing_position_start");

CREATE INDEX IF NOT EXISTS "ix_training_sessions_session_path"
    ON public."training_sessions" USING GIST ("session_path");

CREATE INDEX IF NOT EXISTS "ix_weapon_training_scenarios_exercise_boundary"
    ON public."weapon_training_scenarios" USING GIST ("exercise_boundary");

-- Ready for queries like:
-- ST_DWithin(shooter_position, target_position, 500)
-- ST_3DDistance(impact_point, trajectory)
-- ST_Intersects(session_path, exercise_boundary)
