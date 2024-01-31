import SwaggerUI from 'swagger-ui-react';

import 'swagger-ui-react/swagger-ui.css';
const ApiPage = () => {
  return (
    <div className='App'>
      <SwaggerUI url='/openapi.json' />
    </div>
  );
};
export default ApiPage;