/*
  Warnings:

  - You are about to drop the `BookOnBookAuthor` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "BookOnBookAuthor" DROP CONSTRAINT "BookOnBookAuthor_authorId_fkey";

-- DropForeignKey
ALTER TABLE "BookOnBookAuthor" DROP CONSTRAINT "BookOnBookAuthor_bookId_fkey";

-- DropTable
DROP TABLE "BookOnBookAuthor";

-- CreateTable
CREATE TABLE "_AuthorToBook" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_AuthorToBook_AB_unique" ON "_AuthorToBook"("A", "B");

-- CreateIndex
CREATE INDEX "_AuthorToBook_B_index" ON "_AuthorToBook"("B");

-- AddForeignKey
ALTER TABLE "_AuthorToBook" ADD CONSTRAINT "_AuthorToBook_A_fkey" FOREIGN KEY ("A") REFERENCES "Author"("authorId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AuthorToBook" ADD CONSTRAINT "_AuthorToBook_B_fkey" FOREIGN KEY ("B") REFERENCES "Book"("bookId") ON DELETE CASCADE ON UPDATE CASCADE;
