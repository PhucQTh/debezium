import React from 'react';
import { useSelector } from 'react-redux';
import { Navigate } from 'react-router-dom';
import { appSelector } from 'src/redux/redux-hook';

export const ProtectedRoute = ({
  children,
}: {
  children: React.ReactElement;
}) => {
  const { auth } = useSelector(appSelector);
  const now = Date.now();
  const isAuthExpired = auth && JSON.parse(auth).exp * 1000 < now;
  return isAuthExpired || !auth ? <Navigate to='/login' /> : children;
};
