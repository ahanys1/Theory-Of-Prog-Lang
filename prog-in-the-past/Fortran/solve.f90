program Solve
    implicit none
    
    ! Parameters
    character(len=93), parameter :: ENCRYPTED_STRING = &
        "Kag sa fqxx ftmf hmbup qjuefqzfumxuef cgmow Rdqppk Zuqfleotq ftmf tq omz vgef nufq yq, fiuoq."
    integer, parameter :: ALPHABET_SIZE = 26
    integer, parameter :: ROTCOUNT = 25
    
    ! Variables
    character(len=len(ENCRYPTED_STRING)) :: decrypted_string
    character(len=len(ENCRYPTED_STRING)) :: decrypted_strings(ALPHABET_SIZE)
    integer :: shift
    integer :: i
    integer :: strLen
    
    ! Calculate length of input string
    strLen = len_trim(ENCRYPTED_STRING)
    
    ! Decrypt all rotations
    do shift = 0, ROTCOUNT
        do i = 1, strLen
            if (ENCRYPTED_STRING(i:i) >= 'A' .and. ENCRYPTED_STRING(i:i) <= 'Z') then
                decrypted_string(i:i) = char(mod(ichar(ENCRYPTED_STRING(i:i)) - ichar('A') - &
                    shift + ALPHABET_SIZE, ALPHABET_SIZE) + ichar('A'))
            else if (ENCRYPTED_STRING(i:i) >= 'a' .and. ENCRYPTED_STRING(i:i) <= 'z') then
                decrypted_string(i:i) = char(mod(ichar(ENCRYPTED_STRING(i:i)) - ichar('a') - &
                    shift + ALPHABET_SIZE, ALPHABET_SIZE) + ichar('a'))
            else
                decrypted_string(i:i) = ENCRYPTED_STRING(i:i)
            end if
        end do
        decrypted_strings(shift + 1) = decrypted_string
    end do
    
    ! Print decrypted strings for all rotations
    print *, "Encrypted: ", ENCRYPTED_STRING
    do shift = 0, ROTCOUNT
        print *, "rot:", shift, ": ", decrypted_strings(shift + 1)
    end do
end program Solve
