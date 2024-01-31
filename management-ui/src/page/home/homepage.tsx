import classNames from 'classnames/bind';
import { Link } from 'react-router-dom';
import styles from 'src/page/home/homepage.module.scss';
const cx = classNames.bind(styles);
const HomePage = () => {
  return (
    <div className={cx('wrapper')}>
      {homeItem.map((item, index) => {
        const { to, img, title } = item;
        return (
          <Link to={to} className={cx('item-card')} key={index}>
            <img src={img} alt='' className={cx('item-img')} />
            <div>{title}</div>
          </Link>
        );
      })}
    </div>
  );
};
const config = JSON.parse(localStorage.getItem('config')!) || {};
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
    title: 'Consumers Management',
    to: '/consumers',
    img: '/consumer.png',
  },
  {
    title: 'Binlog Management',
    to: '/database-management',
    img: '/database.png',
  },
  {
    title: 'Swagger',
    to: '/swagger',
    img: '/swagger-logo.png',
  },
];

export default HomePage;
