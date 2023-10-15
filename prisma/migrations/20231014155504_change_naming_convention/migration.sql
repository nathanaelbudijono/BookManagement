/*
  Warnings:

  - You are about to drop the column `publisherPublisherId` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the column `libaryBranchLibaryBranchId` on the `BookCopies` table. All the data in the column will be lost.
  - You are about to drop the column `borrowerBorrowerId` on the `BookLoans` table. All the data in the column will be lost.
  - You are about to drop the column `libaryBranchLibaryBranchId` on the `BookLoans` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_publisherPublisherId_fkey";

-- DropForeignKey
ALTER TABLE "BookCopies" DROP CONSTRAINT "BookCopies_libaryBranchLibaryBranchId_fkey";

-- DropForeignKey
ALTER TABLE "BookLoans" DROP CONSTRAINT "BookLoans_borrowerBorrowerId_fkey";

-- DropForeignKey
ALTER TABLE "BookLoans" DROP CONSTRAINT "BookLoans_libaryBranchLibaryBranchId_fkey";

-- AlterTable
ALTER TABLE "Book" DROP COLUMN "publisherPublisherId",
ADD COLUMN     "publisherId" INTEGER;

-- AlterTable
ALTER TABLE "BookCopies" DROP COLUMN "libaryBranchLibaryBranchId",
ADD COLUMN     "libaryBranchId" INTEGER;

-- AlterTable
ALTER TABLE "BookLoans" DROP COLUMN "borrowerBorrowerId",
DROP COLUMN "libaryBranchLibaryBranchId",
ADD COLUMN     "borrowerId" INTEGER,
ADD COLUMN     "libaryBranchId" INTEGER;

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_publisherId_fkey" FOREIGN KEY ("publisherId") REFERENCES "Publisher"("publisherId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookCopies" ADD CONSTRAINT "BookCopies_libaryBranchId_fkey" FOREIGN KEY ("libaryBranchId") REFERENCES "LibaryBranch"("libaryBranchId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookLoans" ADD CONSTRAINT "BookLoans_borrowerId_fkey" FOREIGN KEY ("borrowerId") REFERENCES "Borrower"("borrowerId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookLoans" ADD CONSTRAINT "BookLoans_libaryBranchId_fkey" FOREIGN KEY ("libaryBranchId") REFERENCES "LibaryBranch"("libaryBranchId") ON DELETE SET NULL ON UPDATE CASCADE;
