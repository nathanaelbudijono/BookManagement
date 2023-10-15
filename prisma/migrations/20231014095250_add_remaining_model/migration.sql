-- AlterTable
ALTER TABLE "Book" ADD COLUMN     "bookCopiesBookCopiesId" INTEGER,
ADD COLUMN     "bookLoansBookLoansId" INTEGER;

-- CreateTable
CREATE TABLE "BookCopies" (
    "bookCopiesId" INTEGER NOT NULL,
    "noOfCopies" INTEGER NOT NULL,
    "libaryBranchLibaryBranchId" INTEGER,

    CONSTRAINT "BookCopies_pkey" PRIMARY KEY ("bookCopiesId")
);

-- CreateTable
CREATE TABLE "BookLoans" (
    "bookLoansId" INTEGER NOT NULL,
    "dateOut" TIMESTAMP(3) NOT NULL,
    "dueDate" TIMESTAMP(3) NOT NULL,
    "borrowerBorrowerId" INTEGER,

    CONSTRAINT "BookLoans_pkey" PRIMARY KEY ("bookLoansId")
);

-- CreateTable
CREATE TABLE "LibaryBranch" (
    "libaryBranchId" INTEGER NOT NULL,
    "branchName" TEXT NOT NULL,
    "Address" TEXT NOT NULL,

    CONSTRAINT "LibaryBranch_pkey" PRIMARY KEY ("libaryBranchId")
);

-- CreateTable
CREATE TABLE "Borrower" (
    "borrowerId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phone" TEXT NOT NULL,

    CONSTRAINT "Borrower_pkey" PRIMARY KEY ("borrowerId")
);

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_bookCopiesBookCopiesId_fkey" FOREIGN KEY ("bookCopiesBookCopiesId") REFERENCES "BookCopies"("bookCopiesId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_bookLoansBookLoansId_fkey" FOREIGN KEY ("bookLoansBookLoansId") REFERENCES "BookLoans"("bookLoansId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookCopies" ADD CONSTRAINT "BookCopies_libaryBranchLibaryBranchId_fkey" FOREIGN KEY ("libaryBranchLibaryBranchId") REFERENCES "LibaryBranch"("libaryBranchId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BookLoans" ADD CONSTRAINT "BookLoans_borrowerBorrowerId_fkey" FOREIGN KEY ("borrowerBorrowerId") REFERENCES "Borrower"("borrowerId") ON DELETE SET NULL ON UPDATE CASCADE;
