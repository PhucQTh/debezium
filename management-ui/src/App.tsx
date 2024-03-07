import React from 'react';
import DefaultLayout from 'src/components/layout/default';
import HomePage from './page/home/homepage';
import 'react-toastify/dist/ReactToastify.css';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import { ToastContainer } from 'react-toastify';
import ReplicaManagementPage from './page/replica-management-page/replica-management';
import ReplicaIndexPage from './page/replica-management-page/replica-index';
import ConnectorCreate from './page/replica-management-page/replica-connector-create';
import DatabaseIndexPage from './page/database-management/database-index';
import LoginPage from './page/auth/login-page';
import { useAppDispatch } from './redux/redux-hook';
import appSlice from './redux/app-slice';
import { hostConfig } from './config/config';
import { ProtectedRoute } from './page/auth/protect';
import ConsumerIndex from './page/consumer/consumer-index';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ReactQueryDevtools } from '@tanstack/react-query-devtools';
import ApiPage from './page/api-document/apipage';
import SyncMonitoringPage from './page/sync-monitoring/sync-monitoring-page';

const App: React.FC = () => {
  // SET ENV FROM LOCAL STORAGE TO REDUX IN THE FIRST TIME APP RUN
  const dispatch = useAppDispatch();
  !localStorage.getItem('environment') &&
    dispatch(appSlice.actions.setEnv(hostConfig[0].name));
  //==========================================================================
  const queryClient = new QueryClient({
    defaultOptions: {
      queries: {
        refetchOnWindowFocus: false,
      },
    },
  });
  return (
    <BrowserRouter>
      <QueryClientProvider client={queryClient}>
        <DefaultLayout>
          <Routes>
            {routes.map((route, key) => (
              <Route
                key={key}
                path={route.path}
                element={
                  route.protect === true ? (
                    <ProtectedRoute>{<route.element />}</ProtectedRoute>
                  ) : (
                    <route.element />
                  )
                }
              />
            ))}
          </Routes>
          <ToastContainer
            position='top-right'
            autoClose={5000}
            hideProgressBar={false}
            newestOnTop={true}
            closeOnClick
            rtl={false}
            pauseOnFocusLoss
            draggable
            pauseOnHover={false}
            theme='light'
          />
          <ReactQueryDevtools
            initialIsOpen={false}
            styleNonce='font-size:2rem'
          />
        </DefaultLayout>
      </QueryClientProvider>
    </BrowserRouter>
  );
};

const routes = [
  { name: 'Home', path: '/', element: HomePage, protect: true },
  {
    name: 'Replica Index',
    path: '/replica-management',
    element: ReplicaIndexPage,
    protect: true,
  },
  {
    name: 'Replica Management',
    path: '/replica-management/:connector',
    element: ReplicaManagementPage,
    protect: true,
  },
  {
    name: 'Create Connector',
    path: '/create-connector',
    element: ConnectorCreate,
    protect: true,
  },
  {
    name: 'Database Management',
    path: '/database-management',
    element: DatabaseIndexPage,
    protect: true,
  },
  {
    name: 'Consumer Management',
    path: '/consumers',
    element: ConsumerIndex,
    protect: true,
  },
  {
    name: 'Swagger',
    path: '/swagger',
    element: ApiPage,
    protect: true,
  },
  {
    name: 'Sync Monitoring',
    path: '/sync-monitoring',
    element: SyncMonitoringPage,
    protect: true,
  },
  {
    name: 'Login',
    path: '/login',
    element: LoginPage,
    protect: false,
  },
];
export default App;
