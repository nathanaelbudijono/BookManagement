-- CreateTable
CREATE TABLE "Author" (
    "authorId" INTEGER NOT NULL,
    "authorName" TEXT NOT NULL,

    CONSTRAINT "Author_pkey" PRIMARY KEY ("authorId")
);

-- CreateTable
CREATE TABLE "Book" (
    "bookId" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "publisherName" TEXT NOT NULL,

    CONSTRAINT "Book_pkey" PRIMARY KEY ("bookId")
);

-- CreateTable
CREATE TABLE "BookOnBookAuthor" (
    "authorId" INTEGER NOT NULL,
    "bookId" INTEGER NOT NULL,

    CONSTRAINT "BookOnBookAuthor_pkey" PRIMARY KEY ("authorId","bookId")
);

-- AddForeignKey
ALTER TABLE "BookOnBookAuthor" ADD CONSTRAINT "BookOnBookAuthor_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "Author"("authorId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookOnBookAuthor" ADD CONSTRAINT "BookOnBookAuthor_bookId_fkey" FOREIGN KEY ("bookId") REFERENCES "Book"("bookId") ON DELETE RESTRICT ON UPDATE CASCADE;
