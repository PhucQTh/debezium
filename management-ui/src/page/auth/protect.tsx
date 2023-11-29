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
  if (auth !== 'OK') {
    // user is not authenticated
    return <Navigate to='/login' />;
  }
  return children;
};
