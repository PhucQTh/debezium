import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import classNames from "classnames/bind";
import styles from "src/components/home-card-item/home-card-item.module.scss";
import { Link } from "react-router-dom";
const cx = classNames.bind(styles);

const HomeCardItem = ({ icon, title, to }: any) => {
  return (
    <Link className={cx("item-card")} to={to}>
      <div className={cx("number-indicator")}>
        <span>5</span>
      </div>
      <div className={cx("item-icon")}>
        <FontAwesomeIcon icon={icon} />
      </div>
      <div className={cx("item-title")}>{title}</div>
    </Link>
  );
};

export default HomeCardItem;
