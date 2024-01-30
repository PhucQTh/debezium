import styles from './radar-loader.module.scss';
const RadarLoader = () => {
  return (
    <div className={styles['wrapper']}>
      <div className={styles['loader']}>
        <span></span>
      </div>
    </div>
  );
};

export default RadarLoader;
