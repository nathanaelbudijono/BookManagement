-- AlterTable
ALTER TABLE "Book" ADD COLUMN     "publisherPublisherId" INTEGER;

-- CreateTable
CREATE TABLE "Publisher" (
    "publisherId" INTEGER NOT NULL,
    "publisherName" TEXT NOT NULL,

    CONSTRAINT "Publisher_pkey" PRIMARY KEY ("publisherId")
);

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_publisherPublisherId_fkey" FOREIGN KEY ("publisherPublisherId") REFERENCES "Publisher"("publisherId") ON DELETE SET NULL ON UPDATE CASCADE;
