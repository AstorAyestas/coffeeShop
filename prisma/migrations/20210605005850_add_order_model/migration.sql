/*
  Warnings:

  - You are about to drop the `_FoodToOrder` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `menuId` on the `Food` table. All the data in the column will be lost.
  - Added the required column `updatedAt` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "_FoodToOrder_B_index";

-- DropIndex
DROP INDEX "_FoodToOrder_AB_unique";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "_FoodToOrder";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "FoodOnMenu" (
    "foodId" TEXT NOT NULL,
    "menuId" TEXT NOT NULL,
    "available" DECIMAL NOT NULL DEFAULT 0,

    PRIMARY KEY ("foodId", "menuId"),
    FOREIGN KEY ("foodId") REFERENCES "Food" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("menuId") REFERENCES "Menu" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "FoodOnOrder" (
    "foodId" TEXT NOT NULL,
    "orderId" TEXT NOT NULL,
    "quantity" DECIMAL NOT NULL DEFAULT 0,

    PRIMARY KEY ("foodId", "orderId"),
    FOREIGN KEY ("foodId") REFERENCES "Food" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ("orderId") REFERENCES "Order" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Order" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "delivery" BOOLEAN NOT NULL DEFAULT false,
    "completed" BOOLEAN NOT NULL DEFAULT false,
    "clientId" TEXT,
    FOREIGN KEY ("clientId") REFERENCES "Client" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Order" ("clientId", "createdAt", "id") SELECT "clientId", "createdAt", "id" FROM "Order";
DROP TABLE "Order";
ALTER TABLE "new_Order" RENAME TO "Order";
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
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
