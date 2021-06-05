-- CreateTable
CREATE TABLE "ClientInfo" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "location" TEXT NOT NULL,
    "telephone" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,
    FOREIGN KEY ("clientId") REFERENCES "Client" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Profile" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "description" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,
    FOREIGN KEY ("clientId") REFERENCES "Client" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "ClientInfo_clientId_unique" ON "ClientInfo"("clientId");

-- CreateIndex
CREATE UNIQUE INDEX "Profile_clientId_unique" ON "Profile"("clientId");
