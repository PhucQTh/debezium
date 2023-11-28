import classNames from 'classnames/bind';
import styles from 'src/page/homepage.module.scss';
// import { config } from 'src/config/config';
const cx = classNames.bind(styles);
const HomePage = () => {
  return (
    <div className={cx('wrapper')}>
      {homeItem.map((item, index) => {
        const { to, img, title } = item;
        return (
          <a href={to} className={cx('item-card')} key={index}>
            <img src={img} alt='' className={cx('item-img')} />
            <div>{title}</div>
          </a>
        );
      })}
    </div>
  );
};
const config = JSON.parse(localStorage.getItem('config') || '{}');
const homeItem = [
  {
    title: 'Portainer',
    to: `https://${config.baseUrl}:9443/`,
    img: '/menu_image.png',
    prefix: 42,
  },
  {
    title: 'Kafka UI',
    to: `http://${config.baseUrl}:8980/`,
    img: '/kafka-logo-wide.png',
    prefix: 42,
  },
  {
    title: 'Debezium UI',
    to: `http://${config.baseUrl}:3000/`,
    img: '/debezium.png',
    prefix: 42,
  },

  {
    title: 'Replica DB Management',
    to: '/replica-management',
    img: '/rep-db.png',
  },
  {
    title: 'Binlog Management',
    to: '/database-management',
    img: '/database.png',
  },
];

export default HomePage;
