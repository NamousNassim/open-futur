# Deploying open-futur.com on cPanel

Requirements: **PHP 8.3 or newer** on the host. Laravel 13 will not run on older PHP.
Set it in cPanel → *MultiPHP Manager* (or *Select PHP Version*) for `open-futur.com`.

## 1. Build the upload package (on your machine)

```bash
./deploy.sh
```

This creates `build/open-futur.zip` with:
- production dependencies already installed (`vendor/`), so you don't need Composer on the server
- a production `.env` (`APP_ENV=production`, `APP_DEBUG=false`, `APP_URL=https://open-futur.com`) with a fresh `APP_KEY`

## 2. Upload

1. cPanel → **File Manager** → open your home directory (`/home/<cpanel-user>/`), **not** `public_html`.
2. Upload `open-futur.zip` and **Extract** it. You now have `/home/<cpanel-user>/open-futur/`.
3. Set the permissions of `open-futur/storage` and `open-futur/bootstrap/cache` to `755` (recursively).

## 3. Point the domain to `public/`

Choose **one** of these options:

**Option A (recommended):** cPanel → **Domains** → *Manage* `open-futur.com` → set the
**Document Root** to `open-futur/public`.

**Option B (when the document root can't be changed, e.g. the main domain uses `public_html`):**
Upload the contents of `open-futur/` into `public_html/` instead (the hidden files `.env` and `.htaccess`
included). The root `.htaccess` sends every request to `public/` and blocks access to dotfiles such as `.env`.

## 4. Check it

Open https://open-futur.com. You should see **Hello**.

To get HTTPS, run cPanel → **SSL/TLS Status** → *Run AutoSSL*.

## Troubleshooting

- **500 error:** read `storage/logs/laravel.log`. The usual causes are a PHP version below 8.3 or
  `storage/` not being writable.
- **Blank page or directory listing:** the document root is not pointing to `public/` (see step 3).
