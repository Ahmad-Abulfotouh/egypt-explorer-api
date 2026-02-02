-- CreateEnum
CREATE TYPE "UserRole" AS ENUM ('user', 'admin');

-- CreateEnum
CREATE TYPE "ItemType" AS ENUM ('tour', 'package', 'product');

-- CreateEnum
CREATE TYPE "Visibility" AS ENUM ('visible', 'hidden');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "first_name" VARCHAR(50) NOT NULL,
    "last_name" VARCHAR(50) NOT NULL,
    "email" TEXT NOT NULL,
    "password_hash" VARCHAR(255) NOT NULL,
    "role" "UserRole" NOT NULL DEFAULT 'user',
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profiles" (
    "id" TEXT NOT NULL,
    "city" VARCHAR(80) NOT NULL,
    "accommodation" TEXT NOT NULL,
    "room_number" VARCHAR(8) NOT NULL,
    "phone_number" VARCHAR(15) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "profiles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cities" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(80) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "cities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "languages" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "languages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tours" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "language_id" INTEGER NOT NULL,
    "price_in_pennies" INTEGER NOT NULL,
    "discount_percentage" INTEGER NOT NULL DEFAULT 0,
    "pickup_date" TIMESTAMPTZ NOT NULL,
    "return_date" TIMESTAMPTZ NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tours_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "packages" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "total_price_in_pennies" INTEGER NOT NULL,
    "discount_percentage" INTEGER NOT NULL DEFAULT 0,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "packages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT,
    "price_in_pennies" INTEGER NOT NULL,
    "discount_percentage" INTEGER NOT NULL DEFAULT 0,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categories" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tour_categories" (
    "id" SERIAL NOT NULL,
    "tour_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,

    CONSTRAINT "tour_categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_categories" (
    "id" SERIAL NOT NULL,
    "product_id" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,

    CONSTRAINT "product_categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "package_tours" (
    "id" SERIAL NOT NULL,
    "package_id" INTEGER NOT NULL,
    "tour_id" INTEGER NOT NULL,

    CONSTRAINT "package_tours_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tours_images" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "tour_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tours_images_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_images" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "product_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "products_images_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tours_videos" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "tour_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tours_videos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products_videos" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "product_id" INTEGER NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "products_videos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tour_ratings" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "tour_id" INTEGER NOT NULL,
    "rate" INTEGER NOT NULL,
    "status" "Visibility" NOT NULL DEFAULT 'visible',
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "editet_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tour_ratings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_ratings" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "product_id" INTEGER NOT NULL,
    "rate" INTEGER NOT NULL,
    "status" "Visibility" NOT NULL DEFAULT 'visible',
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "editet_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "product_ratings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tour_comments" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "tour_id" INTEGER NOT NULL,
    "comment" TEXT NOT NULL,
    "status" "Visibility" NOT NULL DEFAULT 'visible',
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tour_comments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tour_comments_edit_history" (
    "id" TEXT NOT NULL,
    "comment_id" TEXT NOT NULL,
    "old_comment" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "tour_comments_edit_history_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_comments" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "product_id" INTEGER NOT NULL,
    "comment" TEXT NOT NULL,
    "status" "Visibility" NOT NULL DEFAULT 'visible',
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "product_comments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_comments_edit_history" (
    "id" TEXT NOT NULL,
    "comment_id" TEXT NOT NULL,
    "old_comment" TEXT NOT NULL,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "product_comments_edit_history_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "wish_list" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "tour_id" INTEGER,
    "package_id" INTEGER,
    "product_id" INTEGER,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "wish_list_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cart" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "tour_id" INTEGER,
    "package_id" INTEGER,
    "product_id" INTEGER,
    "created_at" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "cart_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "categories_name_key" ON "categories"("name");

-- CreateIndex
CREATE UNIQUE INDEX "tour_categories_category_id_tour_id_key" ON "tour_categories"("category_id", "tour_id");

-- CreateIndex
CREATE UNIQUE INDEX "product_categories_category_id_product_id_key" ON "product_categories"("category_id", "product_id");

-- CreateIndex
CREATE UNIQUE INDEX "package_tours_package_id_tour_id_key" ON "package_tours"("package_id", "tour_id");

-- CreateIndex
CREATE UNIQUE INDEX "tour_ratings_user_id_tour_id_key" ON "tour_ratings"("user_id", "tour_id");

-- CreateIndex
CREATE UNIQUE INDEX "product_ratings_user_id_product_id_key" ON "product_ratings"("user_id", "product_id");

-- CreateIndex
CREATE UNIQUE INDEX "tour_comments_user_id_tour_id_key" ON "tour_comments"("user_id", "tour_id");

-- CreateIndex
CREATE UNIQUE INDEX "product_comments_user_id_product_id_key" ON "product_comments"("user_id", "product_id");

-- CreateIndex
CREATE UNIQUE INDEX "wish_list_user_id_tour_id_key" ON "wish_list"("user_id", "tour_id");

-- CreateIndex
CREATE UNIQUE INDEX "wish_list_user_id_package_id_key" ON "wish_list"("user_id", "package_id");

-- CreateIndex
CREATE UNIQUE INDEX "wish_list_user_id_product_id_key" ON "wish_list"("user_id", "product_id");

-- CreateIndex
CREATE UNIQUE INDEX "cart_user_id_tour_id_key" ON "cart"("user_id", "tour_id");

-- CreateIndex
CREATE UNIQUE INDEX "cart_user_id_package_id_key" ON "cart"("user_id", "package_id");

-- CreateIndex
CREATE UNIQUE INDEX "cart_user_id_product_id_key" ON "cart"("user_id", "product_id");

-- AddForeignKey
ALTER TABLE "profiles" ADD CONSTRAINT "profiles_id_fkey" FOREIGN KEY ("id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tours" ADD CONSTRAINT "tours_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tour_categories" ADD CONSTRAINT "tour_categories_tour_id_fkey" FOREIGN KEY ("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tour_categories" ADD CONSTRAINT "tour_categories_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_categories" ADD CONSTRAINT "product_categories_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_categories" ADD CONSTRAINT "product_categories_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "package_tours" ADD CONSTRAINT "package_tours_package_id_fkey" FOREIGN KEY ("package_id") REFERENCES "packages"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "package_tours" ADD CONSTRAINT "package_tours_tour_id_fkey" FOREIGN KEY ("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tours_images" ADD CONSTRAINT "tours_images_tour_id_fkey" FOREIGN KEY ("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_images" ADD CONSTRAINT "products_images_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tours_videos" ADD CONSTRAINT "tours_videos_tour_id_fkey" FOREIGN KEY ("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products_videos" ADD CONSTRAINT "products_videos_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tour_ratings" ADD CONSTRAINT "tour_ratings_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tour_ratings" ADD CONSTRAINT "tour_ratings_tour_id_fkey" FOREIGN KEY ("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_ratings" ADD CONSTRAINT "product_ratings_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_ratings" ADD CONSTRAINT "product_ratings_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tour_comments" ADD CONSTRAINT "tour_comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tour_comments" ADD CONSTRAINT "tour_comments_tour_id_fkey" FOREIGN KEY ("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tour_comments_edit_history" ADD CONSTRAINT "tour_comments_edit_history_comment_id_fkey" FOREIGN KEY ("comment_id") REFERENCES "tour_comments"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_comments" ADD CONSTRAINT "product_comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_comments" ADD CONSTRAINT "product_comments_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_comments_edit_history" ADD CONSTRAINT "product_comments_edit_history_comment_id_fkey" FOREIGN KEY ("comment_id") REFERENCES "product_comments"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wish_list" ADD CONSTRAINT "wish_list_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wish_list" ADD CONSTRAINT "wish_list_tour_id_fkey" FOREIGN KEY ("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wish_list" ADD CONSTRAINT "wish_list_package_id_fkey" FOREIGN KEY ("package_id") REFERENCES "packages"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "wish_list" ADD CONSTRAINT "wish_list_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cart" ADD CONSTRAINT "cart_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cart" ADD CONSTRAINT "cart_tour_id_fkey" FOREIGN KEY ("tour_id") REFERENCES "tours"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cart" ADD CONSTRAINT "cart_package_id_fkey" FOREIGN KEY ("package_id") REFERENCES "packages"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cart" ADD CONSTRAINT "cart_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;
