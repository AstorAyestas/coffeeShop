/*
  Warnings:

  - You are about to drop the column `foodId` on the `Ingredient` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "_FoodToIngredient" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    FOREIGN KEY ("A") REFERENCES "Food" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("B") REFERENCES "Ingredient" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Ingredient" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL
);
INSERT INTO "new_Ingredient" ("description", "id", "name") SELECT "description", "id", "name" FROM "Ingredient";
DROP TABLE "Ingredient";
ALTER TABLE "new_Ingredient" RENAME TO "Ingredient";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "_FoodToIngredient_AB_unique" ON "_FoodToIngredient"("A", "B");

-- CreateIndex
CREATE INDEX "_FoodToIngredient_B_index" ON "_FoodToIngredient"("B");
