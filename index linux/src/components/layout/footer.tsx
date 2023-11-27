import classNames from "classnames/bind";
import React from "react";
import styles from "src/components/layout/footer.module.scss";
const cx = classNames.bind(styles);
function Footer() {
  return (
    <div className={cx("footer-warraper")}>
      <img src="/api-logo.png" alt="" className={cx("apiLogo")} />
      Copyright ©2023 ADVANCE POLYBAG, INC.
    </div>
  );
}

export default Footer;
