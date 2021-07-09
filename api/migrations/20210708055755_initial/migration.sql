-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "password" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Recipie" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "description" TEXT,
    "author" TEXT,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_mode" TEXT,
    "image_id" TEXT,
    "time" DECIMAL(18,4),

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Step" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_mode" TEXT,
    "image_id" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ingredient" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "quantity" DOUBLE PRECISION,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_User_followers_User_following" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Recipie_steps_many" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Recipie_ingredients_many" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User.email_unique" ON "User"("email");

-- CreateIndex
CREATE INDEX "Recipie.author_index" ON "Recipie"("author");

-- CreateIndex
CREATE UNIQUE INDEX "_User_followers_User_following_AB_unique" ON "_User_followers_User_following"("A", "B");

-- CreateIndex
CREATE INDEX "_User_followers_User_following_B_index" ON "_User_followers_User_following"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Recipie_steps_many_AB_unique" ON "_Recipie_steps_many"("A", "B");

-- CreateIndex
CREATE INDEX "_Recipie_steps_many_B_index" ON "_Recipie_steps_many"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Recipie_ingredients_many_AB_unique" ON "_Recipie_ingredients_many"("A", "B");

-- CreateIndex
CREATE INDEX "_Recipie_ingredients_many_B_index" ON "_Recipie_ingredients_many"("B");

-- AddForeignKey
ALTER TABLE "Recipie" ADD FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_User_followers_User_following" ADD FOREIGN KEY ("A") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_User_followers_User_following" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Recipie_steps_many" ADD FOREIGN KEY ("A") REFERENCES "Recipie"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Recipie_steps_many" ADD FOREIGN KEY ("B") REFERENCES "Step"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Recipie_ingredients_many" ADD FOREIGN KEY ("A") REFERENCES "Ingredient"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Recipie_ingredients_many" ADD FOREIGN KEY ("B") REFERENCES "Recipie"("id") ON DELETE CASCADE ON UPDATE CASCADE;
