-- AlterTable
ALTER TABLE "BookLoans" ALTER COLUMN "dateOut" SET DEFAULT CURRENT_TIMESTAMP,
ALTER COLUMN "dueDate" SET DATA TYPE TEXT;
