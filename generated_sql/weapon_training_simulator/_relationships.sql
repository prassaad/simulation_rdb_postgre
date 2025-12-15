-- ================================================
-- FOREIGN KEY CONSTRAINTS
-- ================================================
ALTER TABLE public."training_sessions"
    ADD CONSTRAINT "FK_training_sessions_trainees_trainee_id"
    FOREIGN KEY ("trainee_id") REFERENCES public."trainees" ("id")
    ON DELETE SET NULL ON UPDATE CASCADE;

