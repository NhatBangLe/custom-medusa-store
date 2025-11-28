Step 1: Install dependencies
npm install --legacy-peer-deps

Step 2: Run PostgreSQL and Redis via Docker
docker compose up -d

Step 3: Migrate database
npx medusa db:migrate

Step 4: Create Admin user (email: admin@example.com, password: supersecret)
npx medusa user -e admin@example.com -p supersecret

Step 5: Run application
npm run dev
