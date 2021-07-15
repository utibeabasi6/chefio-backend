-- AlterTable
ALTER TABLE "Recipie" ADD COLUMN     "category" TEXT;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "image_extension" TEXT,
ADD COLUMN     "image_filesize" INTEGER,
ADD COLUMN     "image_height" INTEGER,
ADD COLUMN     "image_id" TEXT,
ADD COLUMN     "image_mode" TEXT,
ADD COLUMN     "image_width" INTEGER;

-- CreateTable
CREATE TABLE "_Recipie_likes_User_likes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_Recipie_likes_User_likes_AB_unique" ON "_Recipie_likes_User_likes"("A", "B");

-- CreateIndex
CREATE INDEX "_Recipie_likes_User_likes_B_index" ON "_Recipie_likes_User_likes"("B");

-- AddForeignKey
ALTER TABLE "_Recipie_likes_User_likes" ADD FOREIGN KEY ("A") REFERENCES "Recipie"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Recipie_likes_User_likes" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
