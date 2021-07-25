import { config } from '@keystone-next/keystone/schema';
import { statelessSessions } from '@keystone-next/keystone/session';
import { createAuth } from '@keystone-next/auth';

import { lists } from './schema';

let sessionSecret = process.env.SESSION_SECRET;

if (!sessionSecret) {
  if (process.env.NODE_ENV === 'production') {
    throw new Error(
      'The SESSION_SECRET environment variable must be set in production'
    );
  } else {
    sessionSecret = '-- DEV COOKIE SECRET; CHANGE ME --';
  }
}

let sessionMaxAge = 60 * 60 * 24 * 30; // 30 days

const { withAuth } = createAuth({
  listKey: 'User',
  identityField: 'email',
  secretField: 'password',
  sessionData: 'name',
  initFirstItem: {
    fields: ['name', 'email', 'password'],
  },
});

const session = statelessSessions({
  maxAge: sessionMaxAge,
  secret: sessionSecret,
});

function buildDbUrl() {
  if (process.env.DATABASE_URL) {
    return `postgres://postgres:gopher@${process.env.DATABASE_URL}:5432/chefio`
  }
}

export default withAuth(
  config({
    server: {
      port: 8080
    },
    db: {
      adapter: 'prisma_postgresql',
      url: buildDbUrl() || 'postgres://postgres:gopher@localhost:5432/chefio',
      useMigrations: true,
    },
    ui: {
      isAccessAllowed: (context) => !!context.session?.data,
    },
    lists,
    session,
    images: {
      upload: 'local',
      local: {
        storagePath: './public/images',
        baseUrl: '/images',
      },
    }
  }),

);
