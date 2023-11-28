import React, { useEffect } from 'react';
import DefaultLayout from 'src/components/layout/default';
import HomePage from './page/homepage';
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
const App: React.FC = () => {
  // SET ENV FROM LOCAL STORAGE TO REDUX IN THE FIRST TIME APP RUN
  const dispath = useAppDispatch();
  useEffect(() => {
    !localStorage.getItem('environment') &&
      dispath(appSlice.actions.setEnv(hostConfig[0].name));
  });
  //==========================================================================
  return (
    <BrowserRouter>
      <DefaultLayout>
        <Routes>
          {routes.map((route, key) => (
            <Route key={key} path={route.path} element={<route.element />} />
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
      </DefaultLayout>
    </BrowserRouter>
  );
};

const routes = [
  { name: 'Home', path: '/', element: HomePage },
  {
    name: 'Replica Index',
    path: '/replica-management',
    element: ReplicaIndexPage,
  },
  {
    name: 'Replica Management',
    path: '/replica-management/:connector',
    element: ReplicaManagementPage,
  },
  {
    name: 'Create Connector',
    path: '/create-connector',
    element: ConnectorCreate,
  },
  {
    name: 'Database Management',
    path: '/database-management',
    element: DatabaseIndexPage,
  },
  {
    name: 'Login',
    path: '/login',
    element: LoginPage,
  },
];
export default App;
