/*
  Warnings:

  - You are about to drop the `Student` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "TeacherType" AS ENUM ('FULLTIME', 'PARTTIME');

-- DropTable
DROP TABLE "Student";

-- CreateTable
CREATE TABLE "student" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "fullName" TEXT NOT NULL,
    "enrolled" BOOLEAN NOT NULL DEFAULT false,
    "deptId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "student_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "department" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" VARCHAR(500),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "department_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "teacher" (
    "id" SERIAL NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "fullName" VARCHAR(255) NOT NULL,
    "courses" BOOLEAN NOT NULL DEFAULT false,
    "type" "TeacherType" NOT NULL DEFAULT 'FULLTIME',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "teacher_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "course" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" VARCHAR(500),
    "teacherId" INTEGER,
    "deptId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "course_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "department_name_key" ON "department"("name");

-- CreateIndex
CREATE UNIQUE INDEX "teacher_email_key" ON "teacher"("email");

-- CreateIndex
CREATE UNIQUE INDEX "course_code_key" ON "course"("code");

-- AddForeignKey
ALTER TABLE "student" ADD CONSTRAINT "student_deptId_fkey" FOREIGN KEY ("deptId") REFERENCES "department"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_deptId_fkey" FOREIGN KEY ("deptId") REFERENCES "department"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "course" ADD CONSTRAINT "course_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "teacher"("id") ON DELETE SET NULL ON UPDATE CASCADE;
