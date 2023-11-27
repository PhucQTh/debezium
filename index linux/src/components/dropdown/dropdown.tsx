import { useState, ReactNode } from 'react';

type DropdownProps = {
  children: ReactNode;
};

const Dropdown = ({ children }: DropdownProps) => {
  const [isOpen, setIsOpen] = useState(false);
  return (
    <div className='relative'>
      <button
        onClick={() => setIsOpen((prev) => !prev)}
        className='bg-blue-200  w-full flex items-center justify-items-center font-bold text-lg rounded-lg tracking-wider border-4 border-transparent hover:border-blue-400 duration-300'
      >
        Handle
      </button>

      {isOpen && (
        <div className='bg-white absolute top-20 flex flex-col items-start rounded-lg p-2 w-full'>
          {children}
        </div>
      )}
    </div>
  );
};

export default Dropdown;
