/*
  Warnings:

  - The primary key for the `FoodImage` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Ingredient` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Food` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Client` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_FoodImage" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "url" TEXT NOT NULL,
    "updatedAt" DATETIME NOT NULL,
    "foodId" TEXT,
    FOREIGN KEY ("foodId") REFERENCES "Food" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_FoodImage" ("foodId", "id", "updatedAt", "url") SELECT "foodId", "id", "updatedAt", "url" FROM "FoodImage";
DROP TABLE "FoodImage";
ALTER TABLE "new_FoodImage" RENAME TO "FoodImage";
CREATE TABLE "new_Ingredient" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL
);
INSERT INTO "new_Ingredient" ("description", "id", "name") SELECT "description", "id", "name" FROM "Ingredient";
DROP TABLE "Ingredient";
ALTER TABLE "new_Ingredient" RENAME TO "Ingredient";
CREATE TABLE "new__FoodToIngredient" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    FOREIGN KEY ("A") REFERENCES "Food" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("B") REFERENCES "Ingredient" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new__FoodToIngredient" ("A", "B") SELECT "A", "B" FROM "_FoodToIngredient";
DROP TABLE "_FoodToIngredient";
ALTER TABLE "new__FoodToIngredient" RENAME TO "_FoodToIngredient";
CREATE UNIQUE INDEX "_FoodToIngredient_AB_unique" ON "_FoodToIngredient"("A", "B");
CREATE INDEX "_FoodToIngredient_B_index" ON "_FoodToIngredient"("B");
CREATE TABLE "new_Food" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "nutritionFacts" TEXT NOT NULL,
    "price" DECIMAL NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Food" ("createdAt", "description", "id", "name", "nutritionFacts", "price", "updatedAt") SELECT "createdAt", "description", "id", "name", "nutritionFacts", "price", "updatedAt" FROM "Food";
DROP TABLE "Food";
ALTER TABLE "new_Food" RENAME TO "Food";
CREATE TABLE "new_Client" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL
);
INSERT INTO "new_Client" ("email", "id", "name") SELECT "email", "id", "name" FROM "Client";
DROP TABLE "Client";
ALTER TABLE "new_Client" RENAME TO "Client";
CREATE UNIQUE INDEX "Client.email_unique" ON "Client"("email");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
