/*
  Warnings:

  - You are about to drop the column `bookLoansBookLoansId` on the `Book` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_bookLoansBookLoansId_fkey";

-- AlterTable
ALTER TABLE "Book" DROP COLUMN "bookLoansBookLoansId";

-- AlterTable
ALTER TABLE "BookLoans" ADD COLUMN     "bookBookId" INTEGER,
ADD COLUMN     "libaryBranchLibaryBranchId" INTEGER;

-- AddForeignKey
ALTER TABLE "BookLoans" ADD CONSTRAINT "BookLoans_bookBookId_fkey" FOREIGN KEY ("bookBookId") REFERENCES "Book"("bookId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookLoans" ADD CONSTRAINT "BookLoans_libaryBranchLibaryBranchId_fkey" FOREIGN KEY ("libaryBranchLibaryBranchId") REFERENCES "LibaryBranch"("libaryBranchId") ON DELETE SET NULL ON UPDATE CASCADE;
