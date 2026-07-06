-- ════════════════════════════════════════════════════
--  MY INSTITUTE – Exam System – Supabase SQL Setup
--  Run this in: Supabase Dashboard → SQL Editor
-- ════════════════════════════════════════════════════

-- ─── 1. USERS TABLE ───────────────────────────────
create table if not exists users (
  id          uuid primary key default gen_random_uuid(),
  name        text not null,
  username    text not null unique,
  password    text not null,
  email       text,
  role        text not null default 'student' check (role in ('admin','student')),
  created_at  timestamptz default now()
);

-- ─── 2. EXAMS TABLE ───────────────────────────────
create table if not exists exams (
  id                uuid primary key default gen_random_uuid(),
  title             text not null,
  subject           text,
  description       text,
  duration_minutes  int not null default 30,
  passing_score     int not null default 60,
  questions         jsonb not null default '[]',
  is_active         boolean not null default true,
  created_at        timestamptz default now()
);

-- ─── 3. RESULTS TABLE ─────────────────────────────
create table if not exists results (
  id                 uuid primary key default gen_random_uuid(),
  student_id         uuid references users(id) on delete cascade,
  exam_id            uuid references exams(id) on delete cascade,
  score              numeric not null,
  answers            jsonb default '{}',
  time_used_seconds  int,
  passed             boolean,
  admin_note         text,
  submitted_at       timestamptz default now()
);

-- ─── 4. DISCOUNTS TABLE ───────────────────────────
create table if not exists discounts (
  id          uuid primary key default gen_random_uuid(),
  student_id  uuid references users(id) on delete cascade,
  code        text not null,
  value       text not null,
  message     text,
  used        boolean not null default false,
  created_at  timestamptz default now()
);

-- ════════════════════════════════════════════════════
--  ROW LEVEL SECURITY (RLS) – IMPORTANT
-- ════════════════════════════════════════════════════

-- Enable RLS on all tables
alter table users      enable row level security;
alter table exams      enable row level security;
alter table results    enable row level security;
alter table discounts  enable row level security;

-- ─── Allow anon key full access (app handles auth) ──
-- users
create policy "allow_all_users"      on users      for all using (true) with check (true);
-- exams
create policy "allow_all_exams"      on exams      for all using (true) with check (true);
-- results
create policy "allow_all_results"    on results    for all using (true) with check (true);
-- discounts
create policy "allow_all_discounts"  on discounts  for all using (true) with check (true);

-- ════════════════════════════════════════════════════
--  SEED: DEFAULT ADMIN ACCOUNT
--  Username: admin   Password: admin123
--  ⚠️  Change the password after first login!
-- ════════════════════════════════════════════════════
insert into users (name, username, password, role)
values ('Administrator', 'admin', 'admin123', 'admin')
on conflict (username) do nothing;

-- ════════════════════════════════════════════════════
--  DONE ✅  Now copy your Project URL and anon key
--  from: Supabase → Settings → API
--  and paste them into index.html (lines 2–3 of script)
-- ════════════════════════════════════════════════════
