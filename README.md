# 🎓 MY Institute – Exam System

نظام امتحانات إلكتروني متكامل لمعهد MY Institute  
**Single-file HTML + Supabase + GitHub Pages**

---

## ✨ المميزات

| الميزة | التفاصيل |
|--------|----------|
| 🔐 تسجيل دخول | أدمن وطلاب بأكونتات منفصلة |
| ⏱ تايمر | كل امتحان له وقت محدد، ينتهي تلقائياً |
| 📝 MCQ | أسئلة اختيار من متعدد (4 خيارات) |
| 🏆 Leaderboard | أفضل الطلاب على الشاشة الرئيسية |
| 🎁 هدايا خصومات | الأدمن يبعت كود خصم لأي طالب |
| 📊 نتائج | الأدمن يشوف كل الدرجات ويكتب ملاحظات |
| 📖 مراجعة | الطالب يراجع إجاباته بعد الامتحان |
| 📱 Responsive | يشتغل على موبايل وكمبيوتر |

---

## 🚀 خطوات الإعداد

### الخطوة 1: إعداد Supabase

1. روح على [supabase.com](https://supabase.com) وعمل أكونت مجاني
2. اعمل **New Project** — اختار اسم واختار كلمة سر قوية
3. بعد ما المشروع يتعمل، روح على **SQL Editor**
4. انسخ محتوى ملف `supabase_setup.sql` والصقه في المحرر
5. اضغط **Run** ✅
6. روح على **Settings → API** وانسخ:
   - `Project URL` → هو `SB_URL`
   - `anon public key` → هو `SB_KEY`

### الخطوة 2: إعداد الكود

افتح ملف `index.html` وابحث عن السطرين دول في أول الـ `<script>`:

```javascript
const SB_URL = 'YOUR_SUPABASE_URL';   // ← الصق Project URL هنا
const SB_KEY = 'YOUR_SUPABASE_ANON_KEY'; // ← الصق anon key هنا
```

### الخطوة 3: إضافة اللوجو

- سمّي ملف اللوجو بتاعك `logo.jpeg`
- حطه في نفس مجلد `index.html`

### الخطوة 4: رفع على GitHub Pages

#### طريقة A – GitHub Desktop (الأسهل)
1. حمّل [GitHub Desktop](https://desktop.github.com)
2. اعمل **New Repository** باسم `my-institute-exam`
3. حط الملفات في مجلد الريبو
4. اعمل Commit ثم Push
5. روح على GitHub → المشروع → **Settings → Pages**
6. في **Source** اختار `GitHub Actions`
7. الموقع هيكون: `https://yourusername.github.io/my-institute-exam`

#### طريقة B – Git CLI
```bash
git init
git add .
git commit -m "Initial commit – MY Institute Exam System"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/my-institute-exam.git
git push -u origin main
```
ثم فعّل GitHub Pages من Settings.

---

## 👤 بيانات الدخول الافتراضية

| | Username | Password |
|--|----------|----------|
| **Admin** | `admin` | `admin123` |

> ⚠️ **غيّر كلمة السر فوراً** بعد أول تسجيل دخول من داخل Supabase

---

## 📋 كيفية الاستخدام

### كأدمن:
1. **Students** → اضغط "+ Add Student" لإنشاء أكونت طالب
2. **Exams** → اضغط "+ Create Exam"، حدد الوقت والأسئلة
3. **Results** → شوف درجات كل الطلاب واكتب ملاحظات
4. **Gifts** → ابعت كود خصم لأي طالب مميز

### كطالب:
1. سجل دخول بالـ username والباسورد اللي الأدمن عملهم
2. شوف الامتحانات المتاحة واضغط Start
3. أجب على الأسئلة قبل انتهاء الوقت
4. شوف نتيجتك وراجع إجاباتك
5. لو فيه هدية، هتظهر لك على شاشة النتيجة

---

## 📁 هيكل الملفات

```
my-institute-exam/
├── index.html          ← التطبيق كله في ملف واحد
├── logo.jpeg           ← لوجو المعهد
├── supabase_setup.sql  ← SQL لإعداد قاعدة البيانات
├── README.md           ← هذا الملف
└── .github/
    └── workflows/
        └── deploy.yml  ← نشر تلقائي على GitHub Pages
```

---

## 🗄️ هيكل قاعدة البيانات

| الجدول | الوصف |
|--------|-------|
| `users` | الأدمن والطلاب (مع username وpassword) |
| `exams` | الامتحانات (العنوان، الوقت، الأسئلة كـ JSON) |
| `results` | نتائج الطلاب (الدرجة، الإجابات، الوقت المستغرق) |
| `discounts` | هدايا الخصومات المرسلة للطلاب |

---

## 🔧 تخصيص إضافي

- **تغيير ألوان المعهد**: ابحث عن `--gold` في CSS وغيّر القيم
- **إضافة مادة جديدة**: من لوحة الأدمن → Exams → Create Exam
- **منع مراجعة الإجابات**: في دالة `showResultPage` أزل زر Review
- **تحديد عدد المحاولات**: أضف شرط في `startExam` يتحقق من عدد مرات الطالب

---

*Built for MY Institute — Quran, Arabic & Islamic Studies*
