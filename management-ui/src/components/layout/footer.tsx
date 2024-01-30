import React from 'react';
import styles from 'src/components/layout/footer.module.scss';
const Footer = React.memo(() => {
  return (
    <div className={styles['footer-warraper']}>
      <img src='/api-logo.png' alt='' className={styles['apiLogo']} />
      Copyright ©2023 ADVANCE POLYBAG, INC.
    </div>
  );
});

export default Footer;
