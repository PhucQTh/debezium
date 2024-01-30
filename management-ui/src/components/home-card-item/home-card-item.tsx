import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import styles from "src/components/home-card-item/home-card-item.module.scss";
import { Link } from "react-router-dom";

const HomeCardItem = ({ icon, title, to }: any) => {
  return (
    <Link className={styles['item-card']} to={to}>
      <div className={styles["number-indicator"]}>
        <span>5</span>
      </div>
      <div className={styles["item-icon"]}>
        <FontAwesomeIcon icon={icon} />
      </div>
      <div className={styles["item-title"]}>{title}</div>
    </Link>
  );
};

export default HomeCardItem;
