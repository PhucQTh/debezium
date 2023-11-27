import { faXmarkCircle } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import classNames from "classnames/bind";
import { LegacyRef, useRef, useState } from "react";
import styles from "src/components/form-input/form-input.module.scss";
const cx = classNames.bind(styles);

const FormInput: React.FC<IFormInputProps> = ({
  type,
  placeholder,
  style,
  clearBtn = false,
  ref,
}) => {
  const handleChange = (e: any) => {
    const searchValue = e.target.value;
    if (!searchValue.startsWith(" ")) {
      setSearchValue(searchValue);
    }
  };

  const [searchValue, setSearchValue] = useState("");
  return (
    <div className={cx("form-input")} style={style}>
      <input
        type={type}
        placeholder={placeholder}
        ref={ref}
        value={searchValue}
        onChange={handleChange}
      />
      {clearBtn && searchValue !== "" && (
        <div className={cx("btn-clear")} onClick={() => setSearchValue("")}>
          CLEAR
        </div>
      )}
    </div>
  );
};
interface IFormInputProps {
  type: React.InputHTMLAttributes<HTMLInputElement>["type"];
  placeholder?: string;
  name?: string;
  ref?: LegacyRef<HTMLInputElement>;
  style?: React.InputHTMLAttributes<HTMLInputElement>["style"];
  clearBtn?: boolean;
}
export default FormInput;
