import classNames from 'classnames/bind';
import { LegacyRef } from 'react';
import styles from 'src/components/form-input/form-input.module.scss';
const cx = classNames.bind(styles);

const FormInput: React.FC<IFormInputProps> = ({
  type,
  placeholder,
  style,
  ref,
  value,
  onChange,
}) => {
  return (
    <div className={cx('form-input')} style={style}>
      <input
        type={type}
        placeholder={placeholder}
        ref={ref}
        value={value}
        onChange={onChange}
      />
    </div>
  );
};
interface IFormInputProps {
  type: React.InputHTMLAttributes<HTMLInputElement>['type'];
  placeholder?: string;
  name?: string;
  ref?: LegacyRef<HTMLInputElement>;
  style?: React.InputHTMLAttributes<HTMLInputElement>['style'];
  clearBtn?: boolean;
  value?: string;
  onChange?: (e: any) => void;
}
export default FormInput;
