-- Killington Trainer Supabase setup
-- Run this once in Supabase SQL Editor.

create table if not exists public.training_states (
  user_id uuid primary key references auth.users(id) on delete cascade,
  state jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default timezone('utc', now())
);

alter table public.training_states enable row level security;

-- Recreate policies so reruns are safe.
drop policy if exists "users can read own state" on public.training_states;
drop policy if exists "users can insert own state" on public.training_states;
drop policy if exists "users can update own state" on public.training_states;

create policy "users can read own state"
on public.training_states
for select
to authenticated
using (auth.uid() = user_id);

create policy "users can insert own state"
on public.training_states
for insert
to authenticated
with check (auth.uid() = user_id);

create policy "users can update own state"
on public.training_states
for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

grant select, insert, update on public.training_states to authenticated;
