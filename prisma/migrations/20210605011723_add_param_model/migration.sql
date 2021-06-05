-- CreateTable
CREATE TABLE "Param" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "value" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Param.name_unique" ON "Param"("name");
