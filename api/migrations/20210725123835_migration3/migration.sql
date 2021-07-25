/*
  Warnings:

  - You are about to drop the column `image_extension` on the `Recipie` table. All the data in the column will be lost.
  - You are about to drop the column `image_filesize` on the `Recipie` table. All the data in the column will be lost.
  - You are about to drop the column `image_height` on the `Recipie` table. All the data in the column will be lost.
  - You are about to drop the column `image_id` on the `Recipie` table. All the data in the column will be lost.
  - You are about to drop the column `image_mode` on the `Recipie` table. All the data in the column will be lost.
  - You are about to drop the column `image_width` on the `Recipie` table. All the data in the column will be lost.
  - You are about to drop the column `image_extension` on the `Step` table. All the data in the column will be lost.
  - You are about to drop the column `image_filesize` on the `Step` table. All the data in the column will be lost.
  - You are about to drop the column `image_height` on the `Step` table. All the data in the column will be lost.
  - You are about to drop the column `image_id` on the `Step` table. All the data in the column will be lost.
  - You are about to drop the column `image_mode` on the `Step` table. All the data in the column will be lost.
  - You are about to drop the column `image_width` on the `Step` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Recipie" DROP COLUMN "image_extension",
DROP COLUMN "image_filesize",
DROP COLUMN "image_height",
DROP COLUMN "image_id",
DROP COLUMN "image_mode",
DROP COLUMN "image_width",
ADD COLUMN     "image" TEXT;

-- AlterTable
ALTER TABLE "Step" DROP COLUMN "image_extension",
DROP COLUMN "image_filesize",
DROP COLUMN "image_height",
DROP COLUMN "image_id",
DROP COLUMN "image_mode",
DROP COLUMN "image_width",
ADD COLUMN     "image" TEXT;
