-- ================================================
-- FOREIGN KEY CONSTRAINTS
-- ================================================
ALTER TABLE public."training_sessions"
 ADD CONSTRAINT "FK_trainingSessions_trainees_traineeId"
 FOREIGN KEY ("trainee_id") REFERENCES public."trainees" ("id");
 ON DELETE SET NULL ON UPDATE CASCADE;

