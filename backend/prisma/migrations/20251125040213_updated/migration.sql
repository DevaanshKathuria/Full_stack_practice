/*
  Warnings:

  - You are about to drop the column `lifespan` on the `Author` table. All the data in the column will be lost.
  - You are about to drop the column `ISBN` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the `_BookGenres` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `isbn` to the `Book` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `_BookGenres` DROP FOREIGN KEY `_BookGenres_A_fkey`;

-- DropForeignKey
ALTER TABLE `_BookGenres` DROP FOREIGN KEY `_BookGenres_B_fkey`;

-- DropIndex
DROP INDEX `Author_url_key` ON `Author`;

-- DropIndex
DROP INDEX `Book_ISBN_key` ON `Book`;

-- DropIndex
DROP INDEX `Book_url_key` ON `Book`;

-- DropIndex
DROP INDEX `Genre_url_key` ON `Genre`;

-- AlterTable
ALTER TABLE `Author` DROP COLUMN `lifespan`,
    ADD COLUMN `lifeSpan` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `Book` DROP COLUMN `ISBN`,
    ADD COLUMN `isbn` VARCHAR(191) NOT NULL;

-- DropTable
DROP TABLE `_BookGenres`;

-- CreateTable
CREATE TABLE `BookGenreMapping` (
    `bookId` INTEGER NOT NULL,
    `genreId` INTEGER NOT NULL,

    PRIMARY KEY (`bookId`, `genreId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `BookGenreMapping` ADD CONSTRAINT `BookGenreMapping_bookId_fkey` FOREIGN KEY (`bookId`) REFERENCES `Book`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BookGenreMapping` ADD CONSTRAINT `BookGenreMapping_genreId_fkey` FOREIGN KEY (`genreId`) REFERENCES `Genre`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
