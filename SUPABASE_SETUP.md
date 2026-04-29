# Supabase Setup for Killington App

## 1) Create a Supabase project
- Open https://supabase.com
- Create a new project
- Wait until it is fully provisioned

## 2) Run SQL setup
- In Supabase, open SQL Editor
- Open local file supabase_setup.sql
- Copy all SQL and run it once

## 3) Enable Email/Password auth
- In Supabase: Authentication -> Providers
- Enable Email provider (Email + Password)
- Keep email confirmations on or off as you prefer

## 4) Get project credentials
- In Supabase: Project Settings -> API
- Copy:
  - Project URL
  - anon public key

## 5) Connect app
- Open killington_app_2.html in your browser
- Click Supabase Setup
- Paste URL and anon key
- Optional: enable Auto Sync
- Click Konfiguration speichern

## 6) Create athlete accounts
- Use Registrieren in the app for Alain and Carina (one email each)
- Then use Einloggen with each account

## 7) Verify private data
- Login as Alain, save a workout, click Cloud speichern
- Logout and login as Carina, save a different workout, click Cloud speichern
- Logout/login back to Alain and click Cloud laden
- Each account should only see its own data

## Notes
- Data is stored in public.training_states with user_id = auth user UUID.
- RLS is strict: a logged-in user can only read/write their own row.
- If email confirmation is enabled, users must confirm email before first login.
