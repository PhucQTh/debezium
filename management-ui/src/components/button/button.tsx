import classNames from 'classnames/bind';
import styles from 'src/components/button/button.module.scss';
import { Link } from 'react-router-dom';
const cx = classNames.bind(styles);
const Button: React.FC<IButtonProps> = ({
  text,
  red = false,
  blue,
  mint,
  onClick,
  height,
  width,
  to,
  href,
  margin,
  mr,
  ml,
  mb,
}) => {
  let Comp: React.ElementType = 'button';
  if (to) {
    Comp = Link;
  } else if (href) {
    Comp = 'a';
  }

  return (
    <Comp
      className={cx('btn', { red, blue, mint, mr, ml, mb })}
      onClick={onClick}
      style={{ height: height, width: width, margin: margin }}
    >
      {text}
    </Comp>
  );
};

interface IButtonProps {
  text: string;
  red?: boolean;
  blue?: boolean;
  mint?: boolean;
  onClick?: () => void;
  height?: string;
  width?: string;
  to?: string;
  href?: string;
  margin?: string;
  mr?: boolean;
  ml?: boolean;
  mb?: boolean;
}

export default Button;
