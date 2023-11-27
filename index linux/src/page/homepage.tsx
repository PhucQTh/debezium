import classNames from 'classnames/bind';
import styles from 'src/page/homepage.module.scss';
import { config } from 'src/config/config';
const cx = classNames.bind(styles);
const HomePage = () => {
  return (
    <div className={cx('wrapper')}>
      {homeItem.map((item, index) => (
        <a href={item.to} className={cx('item-card')} key={index}>
          <img src={item.img} alt='' className={cx('item-img')} />
          <div>{item.title}</div>
        </a>
      ))}
    </div>
  );
};
const homeItem = [
  {
    title: 'Portainer',
    to: `https://${config.baseUrl}:9443/`,
    img: '/menu_image.png',
  },
  {
    title: 'Kafka UI',
    to: `http://${config.baseUrl}:8980/`,
    img: '/kafka-logo-wide.png',
  },
  {
    title: 'Debezium UI',
    to: `http://${config.baseUrl}:3000/`,
    img: '/debezium.png',
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
