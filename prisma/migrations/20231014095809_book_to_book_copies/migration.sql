/*
  Warnings:

  - You are about to drop the column `bookCopiesBookCopiesId` on the `Book` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_bookCopiesBookCopiesId_fkey";

-- AlterTable
ALTER TABLE "Book" DROP COLUMN "bookCopiesBookCopiesId";

-- AlterTable
ALTER TABLE "BookCopies" ADD COLUMN     "bookBookId" INTEGER;

-- AddForeignKey
ALTER TABLE "BookCopies" ADD CONSTRAINT "BookCopies_bookBookId_fkey" FOREIGN KEY ("bookBookId") REFERENCES "Book"("bookId") ON DELETE SET NULL ON UPDATE CASCADE;
