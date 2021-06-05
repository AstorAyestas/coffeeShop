/*
  Warnings:

  - You are about to drop the column `clientId` on the `Profile` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "Profile_clientId_unique";

-- CreateTable
CREATE TABLE "Operator" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "profileId" TEXT,
    FOREIGN KEY ("profileId") REFERENCES "Profile" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Profile" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "description" TEXT NOT NULL
);
INSERT INTO "new_Profile" ("description", "id") SELECT "description", "id" FROM "Profile";
DROP TABLE "Profile";
ALTER TABLE "new_Profile" RENAME TO "Profile";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "Operator.email_unique" ON "Operator"("email");
