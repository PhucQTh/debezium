import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import classNames from "classnames/bind";
import { Link } from "react-router-dom";
import { faPlus } from "@fortawesome/free-solid-svg-icons";
import styles from "src/components/float-button/float-buton.module.scss";
const cx = classNames.bind(styles);
const FloatButton = ({ to }: Props) => {
  return (
    <Link to={to} className={styles["float-btn"]}>
      <FontAwesomeIcon icon={faPlus} fontSize={"3rem"} fontWeight={"bold"} />
    </Link>
  );
};

type Props = {
  to: string;
};
export default FloatButton;
